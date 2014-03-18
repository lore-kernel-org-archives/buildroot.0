From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 18 Mar 2014 14:17:27 +0100
Subject: [Buildroot] Error building Qt5Multimedia
In-Reply-To: <CAAXf6LVvo4VSgkHawfNuftrqW317QzQ8FO2c-1k33datwdpfSg@mail.gmail.com>
References: <53269705.6060805@gmail.com>
 <CAAXf6LVoTKqC61B2fPbwp-9LQZ1ephfpEodHVfqedB7SPyn7kg@mail.gmail.com>
 <532828E8.5040405@gmail.com>
 <CAAXf6LVvo4VSgkHawfNuftrqW317QzQ8FO2c-1k33datwdpfSg@mail.gmail.com>
Message-ID: <53284767.3040408@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,
here my output:

http://pastebin.com/4QkcJ97t

it seems it doesn't find gstreamer:

Checking for openal... no
Checking for alsa... yes
Checking for pulseaudio... no
Checking for gstreamer... no
Checking for resourcepolicy... no

It's strange because it's already built.
What might lead to different behaviors among different machines with the 
same buildroot clone and .config file?

Best regards
Marco

--

Il 18/03/2014 13:08, Thomas De Schampheleire ha scritto:
> Hi Marco,
>
> On Tue, Mar 18, 2014 at 12:07 PM, Marco Trapanese
> <marcotrapanese@gmail.com> wrote:
>> Il 17/03/2014 13:24, Thomas De Schampheleire ha scritto:
>>
>>> I created a build with your .config file, and did not have any error.
>>> libqgsttools is present in qt5multimedia itself:
>>> output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.so.1.0.0
>>> output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.so.1.0
>>> output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.so.1
>>> output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.so
>>> output/build/qt5multimedia-5.2.1/lib/libqgsttools_p.prl Did you do something
>>> special in your buildroot directory/repo ? Try starting from a clean
>>> environment: make clean all Best regards, Thomas
>>
>> Hi Thomas,
>> I tried to:
>>
>> 1) git clone again buildroot, in order to have a clean environment
>> 2) copy my .config file
>> 3) check it with make nconfig (without change anything)
>> 4) make
>>
>> It fails in the same way and under output/build/qt5multimedia-5.2.1/lib
>> there are no libqgsttools* files...
>> I can't understand why it fails only on my pc!
>>
> I have executed 'make qt5multimedia-dirclean qt5multimedia' now and
> pasted the output here:
> http://code.bulix.org/eei5jl-85857
>
> maybe it can be useful for you to analyze the problem on your machine.
>
> Best regards,
> Thomas
>
