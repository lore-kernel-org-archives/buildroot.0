From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 6 Dec 2012 19:41:28 +0000
Subject: [Buildroot] [PATCH v5] neard: new package
In-Reply-To: <87d2yn142e.fsf@dell.be.48ers.dk>
References: <1354732747-5843-1-git-send-email-spdawson@gmail.com>
 <877gow9uqw.fsf@dell.be.48ers.dk> <87d2yn142e.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCMTTUHRqPNR49BLnLxVw2afR-5tBeUuLVgGZc9B0ypDPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter.

On 6 December 2012 17:30, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> It seems to cause build failures though - Care to look at it?
>
> http://autobuild.buildroot.net/results/eb2e3e8c604e26738f73b55e788b969d4a3dee23/build-end.log

The linux/nfc.h kernel header does not exist for pre-3.1.x kernels.
The toolchain used for the autobuild linked above uses 2.6.38 kernel
headers.

To my knowledge, we do not have a mechanism for marking a package as
requiring a [toolchain using a] minimum kernel header version. Is
there a simple way of achieving this, or is it going to require some
new infrastructure?

Simon.
