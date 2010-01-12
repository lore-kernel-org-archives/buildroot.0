From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jan 2010 14:21:57 +0100
Subject: [Buildroot] Application package cross linked to package
 libraries problem
In-Reply-To: <4B4C6C74.9040703@nrl.navy.mil>
References: <4B4C603A.70104@nrl.navy.mil>
	<e4b6ec781001120358g3202f322qa8ae8c9408d8de40@mail.gmail.com>
	<4B4C6C74.9040703@nrl.navy.mil>
Message-ID: <20100112142157.7c4bcb36@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Jan 2010 07:35:00 -0500
Chris Robson <Chris.Robson@nrl.navy.mil> wrote:

> build-juniper-commandline.c:8:27: error: sofia-sip/nua.h: No such
> file or directory

Looks like the sofia-sip headers haven't been installed into
$(STAGING_DIR)/usr/include.

The issue is likely to be in the sofia-sip.mk file rather than in your
application .mk.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
