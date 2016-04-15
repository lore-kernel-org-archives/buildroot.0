From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Apr 2016 11:31:45 +0200
Subject: [Buildroot] [PATCH] gutenprint: fix host build when libusb found
In-Reply-To: <20160402184733.GA8155@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Sat, 2 Apr 2016 20:47:33 +0200")
References: <20160402184733.GA8155@waldemar-brodkorb.de>
Message-ID: <87oa9bgqv2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Allow to disable USB support, otherwise host build breaks when
 > libusb is found as installation tries to install to /usr.
 > Fixes following autobuild error:
 > http://autobuild.buildroot.net/results/081b3be918ac1eaa8cfbc5919e00bc1ea267c1df/

Hmm, but why does that end up with /usr and not $(HOST_DIR)/usr? Is it
picking up a libusb.pc from your host or is our host-libusb .pc file
wrong?

-- 
Bye, Peter Korsgaard
