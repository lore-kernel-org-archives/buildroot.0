From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Nov 2018 13:23:02 +0100
Subject: [Buildroot] [PATCH] Config.in: add BR2_DL_DIR_OPTS
In-Reply-To: <23d9ca8b-1c2a-5f1b-891e-5867b25d1ec7@mind.be>
References: <20181031213930.49837-1-mmayer@broadcom.com>
 <23d9ca8b-1c2a-5f1b-891e-5867b25d1ec7@mind.be>
Message-ID: <20181101122302.GS28575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-11-01 13:19 +0100, Arnout Vandecappelle spake thusly:
> On 31/10/18 22:39, Markus Mayer wrote:
> > Provide a simple mechanism to pass extra arguments to "mkdir" when
> > creating download directories. This can be helpful if one needs the
> > download directories to be writable multiple users ("shared download
> > cache").
> 
>  I think having a Config.in option for this is way overkill. You can just make
> the directory before calling Buildroot, right? And if it is a shared directory,
> it should be created only once anyway.

Yes for the top-level BR2_DL_DIR. But Buildroot does create sub-dirs,
one per package, and Bbuildroot also enforces the umask to 0022, which
means sub-dirs will not have the group-writable bit set.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> [snip]
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
