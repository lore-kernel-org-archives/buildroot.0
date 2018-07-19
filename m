From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 19 Jul 2018 07:58:41 -0300 (BRT)
Subject: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink
In-Reply-To: <87fu0g53wd.fsf@tkos.co.il>
References: <20180718123443.7242-1-casantos@datacom.com.br>
 <20180718150350.4a910b0c@windsurf> <87fu0g53wd.fsf@tkos.co.il>
Message-ID: <589643561.4441380.1531997921281.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Baruch Siach" <baruch@tkos.co.il>
> To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> Cc: "DATACOM" <casantos@datacom.com.br>, "buildroot" <buildroot@buildroot.org>, "Yann Morin" <yann.morin.1998@free.fr>,
> "ratbert90" <aduskett@gmail.com>, "Arnout Vandecappelle" <arnout@mind.be>
> Sent: Wednesday, July 18, 2018 11:57:06 PM
> Subject: Re: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink

> Hi Thomas,
> 
> Thomas Petazzoni writes:
>> Hello,
>>
>> On Wed, 18 Jul 2018 09:34:43 -0300, Carlos Santos wrote:
>>> Prevent creating a dangling symlink when vim is not present on the host
>>> machine. With BR2_ROOTFS_MERGED_USR, just link to "vim", since they are
>>> on the same directory, otherwise link to "../usr/bin/vim".
>>>
>>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
>>
>> Baruch had already sent a patch with the same title/intention, but it
>> is no longer in the pending state in patchwork.
>>
>> Could you clarify what happened, and which of the two patches is
>> relevant ?
> 
> My vim patch is at
> 
>  http://patchwork.ozlabs.org/patch/943314/
> 
> I marked it as Rejected following the comment of Arnout. Carlos' patch
> works around the merged /usr issue by changing the symlink target for
> merged /usr. In my opinion this solution is error prone.

Why?

> It would be
> much easier to allow dangling symlinks in the target directory, and
> tweak the busybox install.sh to cope with that. That's what my pending
> busybox patch suggests.
> 
>  http://patchwork.ozlabs.org/patch/944884/

Both patches could be applied. They are independent from each other.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
