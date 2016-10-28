From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Oct 2016 10:42:25 -0300
Subject: [Buildroot] [PATCH 6/8] python-libxml2: new host package
In-Reply-To: <20161028153255.5c0e15d3@free-electrons.com>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
 <1476321239-13894-6-git-send-email-gustavo@zacarias.com.ar>
 <20161028153255.5c0e15d3@free-electrons.com>
Message-ID: <b36b76d3-1267-b583-1ec5-8884a68f8eac@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/10/16 10:32, Thomas Petazzoni wrote:

> We discussed this patch during the Developers meeting, and I believe
> the general consensus is that we'd instead prefer to introduce hidden
> Config.in knobs for host packages.
>
> This is not only useful for this situation, but also for other
> situations.

Hi. Let's see.

> For this one, I see two possibilities:
>
>  * The python/python3 packages gain some hidden host Config.in options
>    BR2_PACKAGE_HOST_PYTHON(3). The host-libxml2 package then looks at
>    BR2_PACKAGE_HOST_PYTHON(3) and if enabled, then the python support
>    in host-libxml2 is enabled.
>
>    Drawback of this approach is that if we want to do it right, every
>    package that uses host-python(3) should start selecting this new
>    option.

For me this is the cleanest option, even though it will take a bit more 
time to get it right.

>  * The libxml2 package gains a sub-option
>    BR2_PACKAGE_HOST_LIBXML2_PYTHON, which allows to enable python
>    support. Of course, later we could add BR2_PACKAGE_HOST_LIBXML2 as
>    well, and fix the packages that depend on host-libxml2, but it can
>    be done later.

We currently have no BR2_PACKAGE_HOST_LIBXML2 option so we should add 
that and make host-libxml2 depend on host-python when the python option 
is enabled, and make packages select host-libxml2 as well (+ python for 
host-itstool).
It's basically a half-way to achieving the first point, even though 
quick i'm not a big fan.
I'm in no rush to include evince so waiting for 1 is fine with me, which 
probably won't happen until the next cycle.
Regards.
