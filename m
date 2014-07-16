From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 10:24:39 +0200
Subject: [Buildroot] [PATCH 0/3] Make exim more configurable
In-Reply-To: <20140715213125.1b848b48@free-electrons.com>
References: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>
 <20140715213125.1b848b48@free-electrons.com>
Message-ID: <20140716102439.2bcff4ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca,

On Tue, 15 Jul 2014 21:31:25 +0200, Thomas Petazzoni wrote:

> > Luca Ceresoli (3):
> >   exim: allow using a custom configuration file
> 
> Thanks, I've applied this patch.

This patch is causing build issues:
http://autobuild.buildroot.org/results/0db/0db54c555f6c7e635ebf99f86b3f91dc31e441f0/build-end.log.
This happens when randpackageconfig decides to:

  BR2_PACKAGE_EXIM_CUSTOM_CONFIG=y

But of course:

  BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE=""

Options:

 1/ Have a default value for BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE that
    actually works.

 2/ Let me know a proper value for BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE
    that the autobuilder scripts would inject into the configuration
    when BR2_PACKAGE_EXIM_CUSTOM_CONFIG=y. This requires changing the
    autobuilder scripts, and I've no control over the autobuilder
    executed by Peter.

 3/ Exclude configuration that have BR2_PACKAGE_EXIM_CUSTOM_CONFIG=y in
    the autobuilder script. This also requires changing the autobuilder
    scripts, with the same drawback as above: there's nothing I can do
    for Peter's autobuilder machines.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
