From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Sat, 12 Mar 2016 14:52:42 +0100
Subject: [Buildroot] [PATCH 1/1] olimex_imx233_olinuxino_defconfig:
	genimage support
In-Reply-To: <87vb4sggzp.fsf@dell.be.48ers.dk>
References: <1457645651-2472-1-git-send-email-phil@zankapfel.net>
 <87shzxi54b.fsf@dell.be.48ers.dk> <56E3E205.8090701@mind.be>
 <87vb4sggzp.fsf@dell.be.48ers.dk>
Message-ID: <CAPiYbRLgfTDF4D6noo0iu5HmzyKUJrkWGywqL_FU8zFZ=hXB7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12 March 2016 at 10:52, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>  > On 03/11/16 13:14, Peter Korsgaard wrote:
>  >>>>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:
>  > [snip]
>  >> > +# To generate SD Image
>  >> > +BR2_PACKAGE_HOST_GENIMAGE=y
>  >> > +BR2_PACKAGE_HOST_MTOOLS=y
>  >>
>  >> The vfat handling also uses mkdosfs, so we need to add
>  >> BR2_PACKAGE_HOST_DOSFSTOOLS=y as well.
>  >>
>  >> I noticed that we are missing it from some of the other defconfigs as
>  >> well, so I'll fix that.
>
>  >  So, why doesn't Travis detect that?
>
> Presumably because the Ubuntu container has mkdosfs installed?

I looked into it, on my system mkdosfs was installed, that's why I was
able to generate the image.
Is a fallback to system mkdosfs considered a feature or should
genimage only use Buildroot's mkdosfs?

Cheers, Phil
