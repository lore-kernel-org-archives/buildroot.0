From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 23:33:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: fix build with gcc 9
In-Reply-To: <20200822202350.2341347-1-fontaine.fabrice@gmail.com>
References: <20200822202350.2341347-1-fontaine.fabrice@gmail.com>
Message-ID: <20200823233337.0540a172@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat, 22 Aug 2020 22:23:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> + typedef struct {
> +-	struct cmsghdr header;
> + 	int            fd;
> ++	struct cmsghdr header;

Are you sure this fix is correct ?

The cmsghdr structure, as its name suggest, is meant to be the "header
of a message", and that's why it has this zero-length array at the end,
to access the payload of the message. I am not sure what the
consequences are in this specific case, but do you have some
evidence/explanation that this is correct, beyond "it builds fine" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
