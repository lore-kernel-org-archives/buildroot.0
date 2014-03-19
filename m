From: Davide Viti <zinosat@tiscali.it>
Date: Wed, 19 Mar 2014 09:07:10 +0100
Subject: [Buildroot] [PATCH] eigen: (optionally) install unsupported
	modules
In-Reply-To: <CAHXCMMJVzuLtfUNQ5NTE=LOAW1K+e3UexvMV6P3f65wAcH=QOA@mail.gmail.com>
References: <1395173894-4811-1-git-send-email-zinosat@tiscali.it>
 <1395173894-4811-2-git-send-email-zinosat@tiscali.it>
 <20140318235542.2eb029b1@skate>
 <CAHXCMMJVzuLtfUNQ5NTE=LOAW1K+e3UexvMV6P3f65wAcH=QOA@mail.gmail.com>
Message-ID: <-4886126666950459885@unknownmsgid>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel and Thomas,
I can provide a patch that installs the files under
/usr/include/eigen3 and modify my latest patch to install unsupported
under that directory too.

I guess separate patches are preferred.

I can do it later on today.

Regards,
Davide

> Il giorno 19/mar/2014, alle ore 08:25, Samuel Martin <s.martin49@gmail.com> ha scritto:
>
> Thomas, Davide, all,
>
> On Tue, Mar 18, 2014 at 11:55 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Davide Viti,
>>
>>> On Tue, 18 Mar 2014 21:18:14 +0100, Davide Viti wrote:
>>> From: Davide Viti <d.viti@infosolution.it>
> [...]
>>>
>>> +define EIGEN_INSTALL_UNSUPPORTED_MODULES
>>> +     cp -a $(@D)/unsupported $(STAGING_DIR)/usr/include/
>>
>> I'm a bit worried about having a directory called
>> $(STAGING_DIR)/usr/include/unsupported. Shouldn't this directory be
>> installed *below* the $(STAGING_DIR)/usr/include/Eigen directory
>> created by the normal installation of Eigen?
>
> This goes a bit against what eigen's build-system (cmake) does by default.
> The "Eigen" and "unsupported" directories are installed in the same
> include directory
> (defaults: /usr/include/eigen3).
>
> I agree such a change may break some code in Buildroot users' code,
> but I'm also worried about not following default install scheme done
> by upstream projects.
>
>
> Regards,
>
> --
> Samuel
