From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Sep 2013 23:30:28 +0200
Subject: [Buildroot] [PATCH 3/3] python-pyzmq: new package
In-Reply-To: <9DACF022-3037-49C2-ACB9-7187991A4EFA@layer-7.net>
References: <1378071216-19697-1-git-send-email-rommel@layer-7.net>
 <1378071216-19697-3-git-send-email-rommel@layer-7.net>
 <CAAXf6LW=8rf6ScMS0t95f2cDWT4sLxYnMZAnzCYoEQzPVtkKGA@mail.gmail.com>
 <5224B4DB.6060903@mind.be> <9DACF022-3037-49C2-ACB9-7187991A4EFA@layer-7.net>
Message-ID: <522654F4.1090606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/13 20:04, Michael Rommel wrote:
> On Sep 2, 2013, at 17:55 , Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 09/02/13 10:24, Thomas De Schampheleire wrote:
>
> Hi Arnout and Thomas,
>
> I incorporated all your suggestions here and some additional changes I saw myself:
>   - added host-python dependency
>   - removed mentioning of minimum zeromq version needed
>   - combined comments for dependencies on IPv6 and WCHAR
>   - fixed naming of the patch hook
>   - used $(PYTHON_DIR) - although for the heck of me I could not find out, where this is defined :-(

  This variable is defined as part of the $(pkg-generic) infrastructure.

  You can use 'make printvars | grep ^PYTHON_DIR=' to get the expansion. 
Hm, looks like this feature isn't mentioned in the manual...


  Regards,
  Arnout


>   - changed depends on PYTHON from select (actually, I got it wrong, using the select gave the cyclic dependency :-()
>   - named the package, bool and filenames consistently python-pyzmq
>
> Patch will come in some minutes.
>
> Cheers,
>
>     Michael.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
