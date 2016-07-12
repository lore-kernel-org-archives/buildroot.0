From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2016 17:54:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: Add naxsi module option.
In-Reply-To: <CAFSsvmq-bKYVxb3YVNkbqeAp6NCX81JzTikMYCLrwqk-DJLsqQ@mail.gmail.com>
References: <1468259776-26584-1-git-send-email-aduskett@codeblue.com>
 <20160712163312.32b1157e@free-electrons.com>
 <CAFSsvmq-bKYVxb3YVNkbqeAp6NCX81JzTikMYCLrwqk-DJLsqQ@mail.gmail.com>
Message-ID: <20160712175434.18daa4a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 11:08:31 -0400, Adam Duskett wrote:

> > Thanks for this patch. I had a look at this nginx thing, and indeed
> > building third-party modules is annoying, as they can only be built as
> > part of the nginx build process. I.e you cannot build nginx, and then
> > later on build additional third-party extensions.  
> 
> Agreed; I am glad this will be fixed in the future.

Me too :)


> I discussed this with Yani before hand and the reason I submitted it
> like this is because
> we thought that perhaps it would be a bit.... cluttering if we had a
> separate package for each
> new module.
> 
> > * Then, in nginx.mk, if BR2_PACKAGE_NGINX_NAXSI is enabled, you add a
> >   dependency on it, and add a pre-configure hook that creates a
> >   symbolic link from the appropriate location in the nginx source tree
> >   to the directory where nginx-naxsi was extracted.  
> 
> By all means I absolutely can.  Again, are you sure it won't be too
> much clutter?

I don't think so, especially when in the future they plan to add the
possibility of building third-party modules separately. When this will
be possible, we will definitely want to take advantage of this
feature, which means we'll have one Buildroot package per nginx
third-party module.

So we can just as well start today by having separate packages per
nginx third-party module, even if today they do not really build "on
their own".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
