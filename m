From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Apr 2018 18:23:24 +0200
Subject: [Buildroot] Per-package download folders and Git caching
In-Reply-To: <876058qvi4.fsf@dell.be.48ers.dk>
References: <20180403141703.21cd24fe@windsurf>
 <041a5a2a-3f9d-c76e-4c6d-d22ef11cad43@mind.be>
 <876058qvi4.fsf@dell.be.48ers.dk>
Message-ID: <20180403162324.GB2335@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Arnout, All,

On 2018-04-03 15:17 +0200, Peter Korsgaard spake thusly:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>  >  I know a few users that put their download directory on a samba share or a
>  > virtualbox/vmware share which has NTFS as underlying filesystem. Although NTFS
>  > does support hardlinks, I'm not sure that Samba and virtualbox/vmware do. Any
>  > idea what will happen in such a case?
> 
> Then presumably the ln call will fail and we download the tarball again
> in the new location?

No, the script would fail, because the script runs with 'set -e'.

Should we do a cp if ln fails, then?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
