From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 13 Sep 2012 23:07:33 +0200
Subject: [Buildroot] [RFC] Add board support for Raspberry Pi device.
In-Reply-To: <CALR4fELY4B_fYsX8QJdV0P9iAbDkT5T3bKFyEsUX8_tBVyq46Q@mail.gmail.com>
References: <1347402977-17837-1-git-send-email-marek.belisko@open-nandra.com>
 <CALR4fELY4B_fYsX8QJdV0P9iAbDkT5T3bKFyEsUX8_tBVyq46Q@mail.gmail.com>
Message-ID: <CAAfyv37pAPxpozgXEsiAL2weySFY6mT3tz_0SOKPeCv+kCrmxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Diego,
On Thu, Sep 13, 2012 at 10:43 AM, Diego Iastrubni <diegoiast@gmail.com> wrote:
> On Wed, Sep 12, 2012 at 1:36 AM, Marek Belisko
> <marek.belisko@open-nandra.com> wrote:
>>
>> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>>
>> Basic support:
>> - boot binary blobs + VideoCore added in utils package (to avoid fetching 2 times
>>   same repo which is quite big)
> Is it possible to only "check out" those needed blobs with  a single
> "wget" from some stable tag? Why do I need the whole project history
> just to boot my RBPI?
It's hosted on github and github don't have permanent download links (just git).
>
>> - add actual kernel build 3.2.27 with cutdown config
> Is this a vanilla kernel? Can those boot the RBPI now? (sweet...)
Nope this kernel is maintained out of main kernel tree.
>
>>
>> - using external toolchain
> What happens when you choose a regular common ARM toolchain? From my
> tests the RBPI does boot with those CodeSourcery (whatever they are
> called now)  toolchains over NFS when I choose generic ARM.
I know it works. As Arnout comment would be nice to use internal BR toolchain.
>
> When you re-send the patch, I will also look into the package list. I
> looked at what you did in the repository, and IMHO you are building b
> default WAY too much. The default should be busybox, and maybe SSH...
> all other things are related to the application you want to build, not
> the board. Meaning: let the user choose what to compile into his RBPI.
> For example, in none of my tests I needed glib2, which you are
> compiling.
Where do you see glib2 in defconfig? I cannot find it.
>
> GREAT WORK! KEEP IT COMING!

Cheers,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
