From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Sep 2014 11:04:29 +0200
Subject: [Buildroot] [PATCH 1/1] tiff: ensure directory exists before
	installing to it
In-Reply-To: <20140923093751.4addbd77@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 23 Sep 2014 09:37:51 +0200")
References: <1410488467-2093-1-git-send-email-danomimanchego123@gmail.com>
 <20140922192503.23ee2050@free-electrons.com>
 <CANxTyt7ZamM0EW7QsOOMQefeetFdhrWo-wjDnoD0TRZn7Tru+A@mail.gmail.com>
 <20140923093751.4addbd77@free-electrons.com>
Message-ID: <87sijgyste.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I do not have a defconfig that demonstrates this.  I tend to encounter
 >> these kind of error when I do the following trick to observe what
 >> exactly is installed to the target directory:
 >> 
 >> make tiff-rebuild TARGET_DIR=$(pwd)/TIFF
 >> tree TIFF
 >> 
 >> If I hit an error, they I figure that I'm just one mostly empty custom
 >> skeleton and convoluted dependency graph away from hitting the error
 >> in real life.  So then I submit a patch.

 > Ok, thanks for the explanation. However, I'm wondering if we want to
 > support this. By doing this, you completely circumvent the preparation
 > work that is done by Buildroot: when you do make tiff-rebuild, only the
 > building and installation steps are re-executed with a different
 > TARGET_DIR. So any preparation work done before, such as directories
 > created by the global "dirs" target (on which all packages depend) will
 > not be done in your new TARGET_DIR.

 > Peter, Fabio, any opinion on this?

I don't think it is something we should really officially support, but
the specific patch is ok as such, so I will commit it.

-- 
Bye, Peter Korsgaard
