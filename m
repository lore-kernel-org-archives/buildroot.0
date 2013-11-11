From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 11 Nov 2013 16:07:22 +0000
Subject: [Buildroot] [PATCH] icu: Doesn't work on ARC yet
In-Reply-To: <8738n36ipf.fsf@dell.be.48ers.dk>
References: <1384182468-18493-1-git-send-email-mjonker@synopsys.com>
 <8738n36ipf.fsf@dell.be.48ers.dk>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D685F1709A@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > icu depends on __sync_sub_and_fetch and other atomic primitives that
> > don't exist in the ARC toolchain yet.
> 
> Thanks, but you also need to:
> 
> - Add the !arc dependency to the comment line belo
> - Propagate the dependency to icu's reverse dependencies:
> git grep -l 'select BR2_PACKAGE_ICU'
> package/beecrypt/Config.in
> package/cppcms/Config.in
> package/php/Config.ext
> package/qt5/qt5base/Config.in
> package/webkit/Config.in
> 
> Care to fix that and resend?
> 

Thanks for the feedback. A new patch is coming up. I haven't changed package/webkit/Config.in as it cannot be selected for ARC already.

Mischa
