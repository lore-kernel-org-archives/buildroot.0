From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 May 2016 17:57:01 +0200
Subject: [Buildroot] [PATCH] Config.in: Use CDN kernel.org mirror
In-Reply-To: <20160523174643.777faf11@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 23 May 2016 17:46:43 +0200")
References: <1464017813-22503-1-git-send-email-abrodkin@synopsys.com>
 <20160523174643.777faf11@free-electrons.com>
Message-ID: <87bn3wepiq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 23 May 2016 18:36:53 +0300, Alexey Brodkin wrote:
 >> It turned out for quite some time CDN-powered mirror
 >> of kernel.org is available. See this announce:
 >> https://www.kernel.org/introducing-fastly-cdn.html
 >> 
 >> This change switches to that faster mirror by default.
 >> 
 >> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 >> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 >> Cc: Peter Korsgaard <peter@korsgaard.com>

 > That's a good change. It was suggested some time ago on IRC, and we
 > should do it.

 >> config BR2_KERNEL_MIRROR
 >> string "Kernel.org mirror"
 >> -	default "https://www.kernel.org/pub"
 >> +	default "https://cdn.kernel.org/pub"
 >> help
 >> kernel.org is mirrored on a number of servers around the world.
 >> The following allows you to select your preferred mirror.
 >> @@ -236,6 +236,9 @@ config BR2_KERNEL_MIRROR
 >> http://www.XX.kernel.org/pub (XX = country code)
 >> http://mirror.aarnet.edu.au/pub/ftp.kernel.org

 > Should this list of mirrors be removed?

Does it even make sense to have a configuration option for it if the CDN
is used?

-- 
Venlig hilsen,
Peter Korsgaard 
