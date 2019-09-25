From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Sep 2019 22:41:03 +0200
Subject: [Buildroot] [PATCH v3] package/pkg-utils.mk: add dl_dir to
 show-info output
In-Reply-To: <20190925220223.12bc3db7@windsurf>
References: <20190803140433.27967-1-arnout@mind.be>
 <20190925220223.12bc3db7@windsurf>
Message-ID: <20190925204103.GG7274@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On 2019-09-25 22:02 +0200, Thomas Petazzoni spake thusly:
> On Sat,  3 Aug 2019 16:04:33 +0200
> "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:
[--SNIP--]
> > make show-info | jq -r '.[] | ("dl/" + .dl_dir + "/" + .downloads[]?.source)'
[--SNIP--]
> I asked on IRC to Yann what was the difference between this and "make
> external-deps". make external-deps only returns the file name, but not
> its location inside $(BR2_DL_DIR). Perhaps we should change
> external-deps, as it is no longer very useful as it is ? But of course
> that's kind of an API breakage... but moving files into subfolders in
> $(BR2_DL_DIR) was also kind of an API breakage anyway.
> 
> Thoughts?

As much as I like to keep backward compatibility when it makes sense,
external-deps has been broken for ~18 months now (since we moved
downloads to sub-directories), and no one complained. It's even been in
an LTS for 7 months now, and still no complain so far...

Besides, show-info is a versatile and easily extendable solution to
extract this kind of information from Buildroot.

So, what's the point in keeping external-deps?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
