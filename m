From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Nov 2018 09:17:47 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <87muqf5qmo.fsf@dell.be.48ers.dk>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 <762db85d-d4a9-95b5-8280-d46dfd5f2a72@mind.be>
 <20181110175724.GG2445@scaer> <87muqf5qmo.fsf@dell.be.48ers.dk>
Message-ID: <20181112081747.GD10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-11-11 21:02 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Oh, you poinpoint an issue: the tar filesystem must be also modified to
>  > add --xattrs-include='*' otherwise it would not contain any xattrs, and
>  > even less so, any capabilty.
> 
> I believe my tests showed that --xattrs-include isn't needed when
> creating the tarball (but _IS_ needed when extracting), as long as
> --xattrs is passed.

Right, but the tar filesystem does have to be fixed, anyway.

I don't like it that the extraction is not symetric to the creation, and
since this has puzzled us (and a lot of other people), I'd prefer if we
were explicit which xattrs we ionclude.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
