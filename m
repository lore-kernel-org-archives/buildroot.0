From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Jan 2018 22:27:38 +0100
Subject: [Buildroot] [PATCH 1/2] package/xen: Force disable SDL for
 xen-qemu build
In-Reply-To: <CANQCQpY15sA1HHScDLGKn=nrB-UTJNUZXi3zETDdnx9ZsiED8Q@mail.gmail.com>
 (Matthew Weber's message of "Thu, 18 Jan 2018 15:13:49 -0600")
References: <20180118185548.8994-1-alistair.francis@xilinx.com>
 <CANQCQpZqW-4n=12AJM5LCf-ptL=e5i39k9Vcvjyjm9SQOXzhow@mail.gmail.com>
 <CANQCQpY15sA1HHScDLGKn=nrB-UTJNUZXi3zETDdnx9ZsiED8Q@mail.gmail.com>
Message-ID: <874lnieu2d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

Hi,

 > Actually this is cleaner and only sets when the tools build occurs.

 > --- a/package/xen/xen.mk
 > +++ b/package/xen/xen.mk
 > @@ -43,6 +43,7 @@ XEN_DEPENDENCIES += argp-standalone
 >  endif
 >  XEN_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-tools
 >  XEN_MAKE_OPTS += dist-tools
 > +XEN_CONF_OPTS =  --with-extra-qemuu-configure-args="--disable-sdl"

Agreed, but lease make that += like the rest of the file.

-- 
Bye, Peter Korsgaard
