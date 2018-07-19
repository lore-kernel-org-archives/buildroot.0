From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 Jul 2018 05:57:06 +0300
Subject: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink
In-Reply-To: <20180718150350.4a910b0c@windsurf>
References: <20180718123443.7242-1-casantos@datacom.com.br>
 <20180718150350.4a910b0c@windsurf>
Message-ID: <87fu0g53wd.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni writes:
> Hello,
>
> On Wed, 18 Jul 2018 09:34:43 -0300, Carlos Santos wrote:
>> Prevent creating a dangling symlink when vim is not present on the host
>> machine. With BR2_ROOTFS_MERGED_USR, just link to "vim", since they are
>> on the same directory, otherwise link to "../usr/bin/vim".
>>
>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
>
> Baruch had already sent a patch with the same title/intention, but it
> is no longer in the pending state in patchwork.
>
> Could you clarify what happened, and which of the two patches is
> relevant ?

My vim patch is at

  http://patchwork.ozlabs.org/patch/943314/

I marked it as Rejected following the comment of Arnout. Carlos' patch
works around the merged /usr issue by changing the symlink target for
merged /usr. In my opinion this solution is error prone. It would be
much easier to allow dangling symlinks in the target directory, and
tweak the busybox install.sh to cope with that. That's what my pending
busybox patch suggests.

  http://patchwork.ozlabs.org/patch/944884/

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
