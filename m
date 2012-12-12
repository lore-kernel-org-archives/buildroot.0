From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 13 Dec 2012 00:56:47 +0100
Subject: [Buildroot] usb_modeswitch and lsusb yield Segmentation fault
In-Reply-To: <87vcc7m4xn.fsf@dell.be.48ers.dk>
References: <BCF3711885AE41AB966E9545FDB3C8D6@JohanW7><50C54E15.1030008@zacarias.com.ar><97E0CBC5EB794A11A2835644E2E3CC1D@JohanW7><50C5C08D.407@zacarias.com.ar><7EE27C3F912F450282DD2DE63A6A7FED@JohanW7>
 <87vcc7m4xn.fsf@dell.be.48ers.dk>
Message-ID: <35FE416FC00F4D74B44316E0EFAE802E@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi Peter

I tried to reproduce it, but it builds for now with NTPL 
I am trying to figure out why I get the segfaults on lsusb (usbutils) and usb_modeswitch.
(I need usb_modeswitch to use an HSPDA USB stick as network device)

When I select old/stable uClibc 0.9.33.2, then QT is not building....

I remember I have seen this 'pthread_getattr_np' was not declared  in the past, and I am not sure about how this was fixed.

snip
../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:722:42: error: 'pthread_getattr_np' was not declared in this scope
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h: In member function 'T* QTWTF::VectorBuffer<T,
inlineCapacity>::inlineBuffer() [with T = QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int inlineCapacity = 32u]':
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:415:17:   instantiated from 'void QTWTF::VectorBuffer<T,
inlineCapacity>::allocateBuffer(size_t) [with T = QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int inlineCapacity = 32u, size_t
= unsigned int]'
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:808:9:   instantiated from 'void QTWTF::Vector<T,
inlineCapacity>::reserveCapacity(size_t) [with T = QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int inlineCapacity = 32u, size_t
= unsigned int]'
../3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h:745:9:   instantiated from 'void QTWTF::Vector<T,
inlineCapacity>::expandCapacity(size_t) [with T = QTWTF::Vector<QTJSC::Identifier, 64u>*, unsigned int inlineCapacity = 32u, size_t
= unsigned int]'
Snip

I will try a full build again with NPTL to see if this build gets through the end...
Time for a good night sleep now...while the build runs

Johan

-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: woensdag 12 december 2012 20:44
Aan: Sagaert Johan
CC: 'Gustavo Zacarias'; buildroot at busybox.net
Onderwerp: Re: usb_modeswitch and lsusb yield Segmentation fault

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi

 Sagaert> I was using the newer pthreads implementation,  Sagaert> The old/stable pthreads are working for both lsusb (usbutils) and
for usb_modeswitch with uClibc 0.9.33  Sagaert> I did not try NTPL since this breaks the build of GDB.

Really? I don't recall any issues with GDB and NTPL? Could you provide more details, please?

--
Bye, Peter Korsgaard
