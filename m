From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 21:00:29 +0100
Subject: [Buildroot] [PATCH 1/2] package: add python-raven
In-Reply-To: <CAMWSM7gV0Fg64+fbGMF9P00N9mnmu3VEugiYKc=S0sQpO6aeDA@mail.gmail.com>
References: <20171102163419.24155-1-joseph.kogut@gmail.com>
 <20171102213208.4d4236aa@windsurf>
 <CAMWSM7gV0Fg64+fbGMF9P00N9mnmu3VEugiYKc=S0sQpO6aeDA@mail.gmail.com>
Message-ID: <20171103210029.6ddf4546@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Nov 2017 12:08:43 -0700, Joseph Kogut wrote:

> > If you are interested in getting notified of build failures and of further
> > changes in the packages you added or modified, please add yourself to the
> > DEVELOPERS file. This should be done in a separate patch of the series.  
> 
> Did I misunderstand this section, or should the documentation be updated?

The documentation should be updated. Back when we initially introduced
the DEVELOPERS file, we indeed thought that having a separate patch for
the DEVELOPERS file change was best, but we then changed our mind. I
thought we had updated our documentation, but apparently not. Do you
think you could send a patch fixing this?

> > It really doesn't have *any* runtime dependency on other Python  
> modules? I.e if you build just python-raven and the minimal python
> interpreter, it works?
> 
> Now that you mention it, it doesn't have any external requirements,
> but I'm unsure as to whether or not it requires any optional core
> modules. I would assume that it needs urllib at least. I'll test it
> and find out.

Enable just BR2_PACKAGE_PYTHON=y and BR2_PACKAGE_PYTHON_RAVEN=y, build
this, boot, and check that python-raven works correctly on the target.
That's the only way to be sure :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
