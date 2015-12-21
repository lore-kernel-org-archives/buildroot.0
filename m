From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 21:46:58 +0100
Subject: [Buildroot] [PATCH 7/8 RFC] packages: use TARGET_PATH
In-Reply-To: <20151221184436.GB1548@tarshish>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
 <bfe629a2f300528996a23613fb4661b41e972bac.1450712392.git.yann.morin.1998@free.fr>
 <20151221184436.GB1548@tarshish>
Message-ID: <20151221204658.GD3454@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-12-21 20:44 +0200, Baruch Siach spake thusly:
> On Mon, Dec 21, 2015 at 04:56:58PM +0100, Yann E. MORIN wrote:
> > Note that libhid should no longer need that trick, but this woill be
> > fixed independently in a follow-up patch.
> 
> So can BR_PATH be removed entirely from top Makefile after this patch?

I wondered about that.

Still, I think we should keep it, in case we need to update both PATHs
with new entries.

We could obviously do:

    TARGET_PATH = $(FOO_CONFIG_DIR):$(HOST_PATH)

but that would not fly too far if we need to add dirs to HOST_PATH that
should not be in TARGET_PATH.

So I prefer to keep BR_PATH (which we could rename as BR_COMMON_PATH).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
