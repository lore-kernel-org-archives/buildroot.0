From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 7 May 2014 17:45:34 +0200
Subject: [Buildroot] CMake requires ncurses
In-Reply-To: <CAHkwnC_7GBG+a4oh1aLSc7QeaEsC-N0qROcaNuGSE+Wp0=z34g@mail.gmail.com>
References: <CAHkwnC-kaMHjsD9GjPiDLdx5vda2CKAnDVXPX-qAUx+r01MCAQ@mail.gmail.com>
 <20140507164753.48c13d65@free-electrons.com>
 <CAHkwnC_7GBG+a4oh1aLSc7QeaEsC-N0qROcaNuGSE+Wp0=z34g@mail.gmail.com>
Message-ID: <CAHXCMMJOQc=pO=X+C7ruNAGm44wYv3nJEUjKo=+=sNF7+kbzTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio, all,

On Wed, May 7, 2014 at 5:32 PM, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
> On Wed, May 7, 2014 at 4:47 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Fabio Porcedda,
>>
>> On Wed, 7 May 2014 13:53:07 +0200, Fabio Porcedda wrote:
>>
>>> because the cmake package requires the ncurses library, what is best
>>> thing to do?
>>
>> Huh? I built CMake just yesterday, and I don't think ncurses was
>> needed. Isn't it an optional dependency?
>
> Are you sure that In your system there isn't installed the ncurses
> development package?
>

After checking cmake source, it seems ncurses is a dependency of
ccmake program (the CMake curses interface).

Its build can be disabled by adding -DBUILD_CursesDialog=OFF to the
configure command line.

@Fabio: care to test this and cook a patch if it works as expected?

Regards,

-- 
Samuel
