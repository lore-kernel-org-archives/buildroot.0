From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 28 Jul 2012 19:31:50 +0200
Subject: [Buildroot] Understanding More about applying patches
In-Reply-To: <CALo-6+icxYrcFpMD=GtSjfhcMzOAhQ0quKxhgHxf006quMmo5g@mail.gmail.com>
References: <CALo-6+igesYYe2-Wj342CauvCgUZAFnUm9TtmW8+ObmUQvmkNQ@mail.gmail.com>
 <CALo-6+h1H16cYK9HZ7=gf98X3KNSc79D8xMkf=JCQ9d7ph_8Sg@mail.gmail.com>
 <CALo-6+icxYrcFpMD=GtSjfhcMzOAhQ0quKxhgHxf006quMmo5g@mail.gmail.com>
Message-ID: <CAHXCMMLicAFHLWXR9McW+AARUmQiUC4=ZaFPCkvJGMPqem306A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

2012/7/28 Charles Krinke <charles.krinke@gmail.com>:
> Assuming I have the last part correct, the next step is to add a patch
> after the configure step but before the build step.
You have nothing to do here, this is automatically handled by the
package infrastructure,
unless the package uses handwritten *.mk file.

>
> To do this, I need to add the patch to output/build/qt* somehow. So, I
> guess my patching question is extending a bit.
The only thing to do is put the patch in the package directory:
package/<packagename>/<packagename>-<some_description>.patch

>
> On Sat, Jul 28, 2012 at 9:55 AM, Charles Krinke
> <charles.krinke@gmail.com> wrote:
>> Doing a bit of research and trying to answer at least part of my own
>> question, I can see in pkg-gentargets.mk a statement applying patches
>> and it looks like if I prefix the patches with the name of the
>> package, "qt-" in this  case, then buildroot should automagically
>> apply the patches I am trying to add. Is this correct?
Yes, it is.


BTW, here is a bunch of the doc refactoring (still in progress)
talking about patch integration:
https://github.com/tSed/buildroot/blob/sma/docs/docs/manual/patch-policy.txt

Any feedback is welcome.


Cheers,

-- 
Sam
