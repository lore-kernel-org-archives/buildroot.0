From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Mar 2016 15:03:59 +0100
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
In-Reply-To: <56E02A78.1050701@zacarias.com.ar>
References: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
 <87egbj228a.fsf@dell.be.48ers.dk>
 <56E02A78.1050701@zacarias.com.ar>
Message-ID: <20160309150359.4ce78c05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 9 Mar 2016 10:51:52 -0300, Gustavo Zacarias wrote:

> Indeed it does, but you can't have the cake and eat it at once can you?
> Arnout in the famous vala-wrapper thread pointed that we shouldn't 
> hardcode the staging directory in it and i've adjusted accordingly, so 
> which way is it? (same logic would apply to both cases). Re:
> http://lists.busybox.net/pipermail/buildroot/2016-February/153671.html

What about doing this relatively to the wrapper location?

WRAPPER_DIR=$(dirname $0)
STAGING_DIR=$(readlink -f ${WRAPPER_DIR}/../../../staging/)

and there you are, it is both relocatable and doesn't rely on
STAGING_DIR being defined in the environment.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
