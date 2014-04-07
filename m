From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Apr 2014 23:56:12 +0200
Subject: [Buildroot] [PATCH v3] infra: Add PRE_*_HOOKS for every step
In-Reply-To: <20140406143133.69594f69@skate>
References: <1396031372-23308-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20140406143133.69594f69@skate>
Message-ID: <20140407215612.GI3215@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-04-06 14:31 +0200, Thomas Petazzoni spake thusly:
> On Fri, 28 Mar 2014 19:29:32 +0100, Maxime Hadjinlian wrote:
> 
> > +* +LIBFOO_PRE_LEGAL_INFO_HOOKS+
> >  * +LIBFOO_POST_LEGAL_INFO_HOOKS+
> 
> I'm generally fine with the patch, but I'm wondering what's the
> usefulness of the legal-info hooks. I know you're merely adding a
> pre-hook to match an existing post-hook, but I'm wondering what would
> be the usage of a post-legal-info hook actually.

I can think of an example where it would be needed: the freescale imx6
binary blobs for the GPU. There is a license text in the auto-extract
archive, but we do not save it for now (because "that's just too much
effort.")

Adding a pre-legal hook could be useful to extract the license from the
archive, for example.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
