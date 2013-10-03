From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Oct 2013 16:03:53 +0200
Subject: [Buildroot] [PATCH] python-pygame: fix _python_srcdir
In-Reply-To: <CANxTyt6=OSKoxo-nj3i73EUz5v5suEL7aUegHJGSqeTdWSCSNg@mail.gmail.com>
References: <1380766200-2443-1-git-send-email-danomimanchego123@gmail.com>
 <20131003111031.181a669b@skate>
 <CANxTyt6=OSKoxo-nj3i73EUz5v5suEL7aUegHJGSqeTdWSCSNg@mail.gmail.com>
Message-ID: <20131003160353.1dc25db1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Thu, 3 Oct 2013 09:34:37 -0400, Danomi Manchego wrote:

> > I'm just wondering, why do these packages need access to the Python
> > *source* tree? What's missing from $(STAGING_DIR) to build those
> > Python modules?
> >
> > Normally, the source/build tree of each package are just temporary
> > locations, we should *theoretically* be able of removing the
> > source/build tree of a package once its build has completed (well,
> > in practice, there are of course some exceptions, but it seems
> > weird that all Python modules would need these exceptions).
> 
> Unfortunately, I have almost no experience with python, except for
> recently needing to install a proprietary python package at work -
> which caused me to look for examples, which led to noticing that the
> _python_srcdir paths in the two packages were invalid.
> 
> In my case, my module has to be buildable with both python and python3
> (just one or the other in a given build), so dropping the
> _python_srcdir altogether simplified the .mk file, and worked just
> fine for both cases.  (I modified the host-python3 install to create a
> "python" symlink to the host/usr/bin/python3 when python [2] wasn't
> selected, so that other packages can continue to call "python" in
> their build and install commands.)
> 
> I don't know if the people who made python-crc16, -pygame, -pyzmq had
> a reason for specifying the python src path, or if there was just a
> lot of copy/paste from a single source who just thought it seemed like
> a good idea at the time.  The purpose of my two patches was to fix a
> path that was clearly wrong - out of a sense of civic duty to the
> community.  Then, if someone more python-savvy comes along and decides
> that those params are not needed, at least they all look the same.
> (Better for grepping and sed and whatnot.)

Ok, so let's add a bunch of Python-savvy people in Cc and see what they
have to say about _python_srcdir :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
