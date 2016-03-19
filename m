From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Mar 2016 00:40:39 +0100
Subject: [Buildroot] [PATCH 13/16 v5] core/legal-info: generate a hash
 of all saved files
In-Reply-To: <20160319162159.06219d6c@free-electrons.com>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <eb5c50f958b64f8e74123763dca913bde3894bba.1457718289.git.yann.morin.1998@free.fr>
 <20160319162159.06219d6c@free-electrons.com>
Message-ID: <20160319234039.GK3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-19 16:21 +0100, Thomas Petazzoni spake thusly:
> On Fri, 11 Mar 2016 18:49:26 +0100, Yann E. MORIN wrote:
> > Having a hash of the saved files can be interesting for the recipient to
> > verify the integrity of the files.
> > 
> > We remove the warning file earlier, to exclude it from the hash list.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Luca Ceresoli <luca@lucaceresoli.net>
> > Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> > Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> It's adding more stuff to the main Makefile (while I'd like to remove
> stuff from that Makefile), for something that is quite specific. But
> OK, I can see the usefulness of this hash file, so:
> 
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> However, I'm really surprised by this LEGAL_WARNINGS file. It's exactly
> the type of hidden file (like .applied_patches) I don't like. One
> example where it fails badly is if you interrupt "legal-info" in the
> middle. Since the legal-warning and legal-warning-pkg macro only
> concatenate to this file, then at the end of the second,
> non-interrupted, make invocation, you would got some warnings from the
> first run.

Nope, because the very first thing we do for legal-info is to trash the
existing directory before starting to collect any legal-info.

However, I would contend that we should leave that file in place. It is
critical that some stuff could not be saved, so that all-caps file is a
godd indication that something is wrong.

> Why aren't we simply displaying the warnings as we go? Probably because
> they were mixed with some other messages (like the messages about
> download some stuff). But in this case, we can serialize the steps by
> having all the download done first, then all the "aggregation" done, so
> that warnings can be displayed directly without this hidden file.

Yes, we could do that, but I'd still keep the file. Delegate to the user
the responsibility to remove it.

> Of course, this is unrelated to your change, and more a comment for
> Luca.

I can have a look as a follow-up series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
