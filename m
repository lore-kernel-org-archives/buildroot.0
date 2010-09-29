From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 29 Sep 2010 11:47:01 +0300
Subject: [Buildroot] auotgen.sh running before ./configure
In-Reply-To: <AANLkTinQeDF2F6zEm6gfmn7qvzbtkQyMF_XB3m81Bv5p@mail.gmail.com>
References: <AANLkTinXKfGsCB8rESiT7iTMMdcrRkJgKUk7hXWD1VpH@mail.gmail.com>
	<AANLkTinRWJnXGYUq5fffAY+y6ZTF8pN2gNKguuiUNe_c@mail.gmail.com>
	<AANLkTincNjofJjrjL0Ysm9hxWTPo5kp8iqopxEwnBfbG@mail.gmail.com>
	<AANLkTinaR89uhQJ=i9zWnmMvPM0sJWn-JMS_1b_q=5bP@mail.gmail.com>
	<AANLkTinQeDF2F6zEm6gfmn7qvzbtkQyMF_XB3m81Bv5p@mail.gmail.com>
Message-ID: <AANLkTinyxSx--CpDSOCJT6+xmEhb12pfRhZu1RYtjSBf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 29, 2010 at 11:28 AM, Belisko Marek <marek.belisko@gmail.com> wrote:
> On Wed, Sep 29, 2010 at 10:23 AM, Paulius Zaleckas
> <paulius.zaleckas@gmail.com> wrote:
>> On Wed, Sep 29, 2010 at 10:57 AM, Belisko Marek <marek.belisko@gmail.com> wrote:
>>> Hi,
>>>
>>> On Mon, Sep 27, 2010 at 10:16 AM, Paulius Zaleckas
>>> <paulius.zaleckas@gmail.com> wrote:
>>>> On Mon, Sep 27, 2010 at 8:36 AM, Belisko Marek <marek.belisko@gmail.com> wrote:
>>>>> Hi,
>>>>>
>>>>> I want to add navit package (navigation sw) to buildroot.
>>>>> Compilation steps described on navit wiki is:
>>>>> 1. run ./autogen.sh
>>>>> 2. then ./configure; make ....
>>>>>
>>>>> How can I add autogen.sh script running before ./configure?
>>>>> It is done automatically?
>>>>>
>>>>> Thanks in advance,
>>>>
>>>> I have a patch for navit:
>>>> http://sourceforge.net/apps/trac/navitux/export/128/trunk/buildroot/patches/navit.patch
>>>>
>>>> SVN revision is old... so you may want to update it.
>>> Did you try compile navit with qt_painter? I try and have some
>>> troubles with include when
>>> compiling qt_painter.cpp. It seems include paths are somehow
>>> incorrectly handled for QtGui and
>>> QtCore. Did you have similar problems?
>>
>> No, I haven't tried Qt, I am always compiling with GTK+.
>>
>>> e.g.: -I/home/open-nandra/projects/buildroot_new/output/staging/home/open-nandra/projects/buildroot_new/output/staging/usr/include/QtGui
>>> is wrong because
>>> /home/open-nandra/projects/buildroot_new/output/staging shouldn't be
>>> at the beginning of the string.
>>
>> Looks like a problem with ./configure script...
>> What version of Navit are you trying to compile?
> Version 3537.

Can you show me 'grep QT_GUI_CFLAGS= config.log' output from navit
build directory (most likely output/build/navit-3537)
