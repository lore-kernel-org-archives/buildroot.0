From: Zac Wheeler <zac.wheeler@gmail.com>
Date: Mon, 16 Feb 2009 18:23:51 -0800
Subject: [Buildroot] Basic VCS/SCM Integration
Message-ID: <206b9e70902161823w1bcadf1cif17bb7ce47f35df1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I'm sorry if this question has been raised, but a recent search turned
up nothing.

I am working with buildroot and like being able to pull from a SCM
tool (in this case git in particular). I got this working with an
earlier version (snapshot from June 08) by just adding another DL
COMMAND in Makefile.autotools.in, i.e.
DL_COMMAND.git = $(GIT) $($(PKG)_SITE)/$($(PKG)_SOURCE)
$(DL_DIR)/$($(PKG)_SOURCE); \
                 cd $(DL_DIR)/$($(PKG)_SOURCE); git checkout $($(PKG)_VERSION)

and just an 'ln -s' for the INFLATE. The software I am working on
hasn't been released and I didn't get around to cleaning it up for a
patch (my bad).

Now that downloading is a separate call in the makefile it appears to
provide no provision exists for a build-time download command other
than wget. Was this just a simplification because all the other
DL_COMMANDs were identical? Is anyone opposed to it being added again?
Does anyone have a suggestion for a better way? If I'm going to do the
work I'd just as soon have it easily reintegrated into the head. I'm
only interested in autotools-capable package support.

Thanks,
Zac
