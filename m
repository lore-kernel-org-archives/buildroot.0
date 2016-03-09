From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Mar 2016 15:50:41 +0100
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
In-Reply-To: <8760wv2079.fsf@dell.be.48ers.dk>
References: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
 <87egbj228a.fsf@dell.be.48ers.dk>
 <56E02A78.1050701@zacarias.com.ar>
 <20160309150359.4ce78c05@free-electrons.com>
 <8760wv2079.fsf@dell.be.48ers.dk>
Message-ID: <20160309155041.5aac1077@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 09 Mar 2016 15:30:18 +0100, Peter Korsgaard wrote:

>  > WRAPPER_DIR=$(dirname $0)
> 
> That relies on argv[0] containing the full path, which it normally will
> do when you run it from the shell, but isn't guaranteed to work. If we
> want to support that then we should use /proc/self/exe

Well, OK.

> > STAGING_DIR=$(readlink -f ${WRAPPER_DIR}/../../../staging/)
> 
> This will only work if you keep the entire buildroot output around (or
> rather output/staging) and don't customize the BR2_HOST_DIR.

Indeed, so we need to do like Arnout suggests, hardcoding the tuple
inside the script, so that we really only on the contents of host/, and
not on the staging symlink.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
