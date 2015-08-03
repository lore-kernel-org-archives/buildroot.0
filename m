From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Aug 2015 23:16:39 +0200
Subject: [Buildroot] [PATCH v1 2/3] aufs: new kernel extension.
In-Reply-To: <20150803211325.GQ3647@free.fr>
References: <1438387017-10597-1-git-send-email-christian@paral.in>
 <1438387017-10597-2-git-send-email-christian@paral.in>
 <20150803211325.GQ3647@free.fr>
Message-ID: <20150803211639.GR3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2015-08-03 23:13 +0200, Yann E. MORIN spake thusly:
> On 2015-07-31 16:56 -0700, Christian Stewart spake thusly:
> > Adding a kernel extension that patches the kernel with the correct
> > version of aufs-standalone. This relies on the user ensuring the
> > correct version is set in the configs.
[--SNIP--]
> > +# While we don't build from the kernel headers
> > +# we can get a default value here
> > +config BR2_PACKAGE_AUFS_STANDALONE_VERSION
> > +	string "aufs-standalone branch"

Ah, I missed that this had a prompt. And I missed the comment.

[--SNIP--]
> > +	default "3.0"  if BR2_KERNEL_HEADERS_3_0
> > +	default "3.1"  if BR2_KERNEL_HEADERS_3_2 || BR2_KERNEL_HEADERS_3_4
> > +	default "3.10" if BR2_KERNEL_HEADERS_3_10
> > +	default "3.11" if BR2_KERNEL_HEADERS_3_11
> > +	default "3.12" if BR2_KERNEL_HEADERS_3_12
> > +	default "3.13" if BR2_KERNEL_HEADERS_3_13
> > +	default "3.14" if BR2_KERNEL_HEADERS_3_14
> > +	default "3.15" if BR2_KERNEL_HEADERS_3_15
> > +	default "3.16" if BR2_KERNEL_HEADERS_3_16
> > +	default "3.17" if BR2_KERNEL_HEADERS_3_17
> > +	default "3.18" if BR2_KERNEL_HEADERS_3_18
> > +	default "3.19" if BR2_KERNEL_HEADERS_3_19
> > +	default "4.0"  if BR2_KERNEL_HEADERS_4_0
> > +	default "4.1"  if BR2_KERNEL_HEADERS_4_1

Well, I don't think we should try to be smart. Just leave the field
empty...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
