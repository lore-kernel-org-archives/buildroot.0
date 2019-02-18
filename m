From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 23:26:43 +0100
Subject: [Buildroot] [PATCH] package/systemd: set vconsole support
 option to default y
In-Reply-To: <20190206141622.4fbbe0f6@windsurf> (Thomas Petazzoni's message of
 "Wed, 6 Feb 2019 14:16:22 +0100")
References: <1dc021862b1041c3990d6ce25bb331ca@exitstrategytech.com>
 <20190206141622.4fbbe0f6@windsurf>
Message-ID: <87o978bun0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Fri, 4 Jan 2019 21:35:23 +0000
 > "David J. Fogle" <Dave@exitstrategytech.com> wrote:

 >> package/systemd:? set vconsole support option to default y
 >> 
 >> Without this support option enabled, systemd does not allow vterm
 >> switching, and could possibly lead to user lockout on tty1.
 >> 
 >> We prevent these scenarios by enabling the vconsole tool default y,
 >> as console login is much more prevalent than not. This allows the
 >> option to disable the tool if needed, but as this is a rare usage,
 >> it is better to let a user decide they do *not* need it than to
 >> expect them to know they *do*.
 >> 
 >> Any serial connections will not be impacted by absence of this tool, as there are no vconsoles on serial.
 >> 
 >> Signed-off-by: David Fogle <dave@exitstrategytech.com>
 >> ---
 >> ?package/systemd/Config.in | 1 +
 >> ?1 file changed, 1 insertion(+)

 > Applied to master with the reworked commit message proposed by Yann.
 > Thanks!

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
