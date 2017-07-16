From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 16:05:47 +0200
Subject: [Buildroot] [PATCH next 1/3] ed: add host package
In-Reply-To: <20170512142848.13956-1-Vincent.Riera@imgtec.com>
References: <20170512142848.13956-1-Vincent.Riera@imgtec.com>
Message-ID: <20170716160547.347fade2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 May 2017 15:28:46 +0100, Vicente Olivert Riera wrote:
> This will be necessary for updating bc's version in a subsequent patch.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/ed/ed.mk | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

I had a look at all of this, and my feeling is the same as the
OpenEmbedded folks: this really sucks. Why on earth do they need "ed"?
Why don't they fix their build system to build fbc for the host?

See https://patchwork.openembedded.org/patch/140001/ for the feedback
from OpenEmbedded people. I really don't think there's a compelling
reason to upgrade to 1.07.1 for now, so let's keep 1.06 and avoid this
mess.

I've mailed the submitter of the OE patch, who said he would contact
the upstream GNU bc maintainer, in order to see if he got some
feedback. You are in Cc of this e-mail.

In addition, there was an issue in your patch: GNU bc has moved to GNU
GPLv3+ since this 1.07.1 release, so the licensing details should be
fixed as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
