From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 9 May 2013 08:52:12 -0500
Subject: [Buildroot] [PATCH 1/2] gstreamer1: Add gstreamer version 1.0.7
	package
In-Reply-To: <20130509110839.684d4037@skate>
References: <1368057893-20874-1-git-send-email-spenser@gillilanding.com>
 <20130509110839.684d4037@skate>
Message-ID: <CAEBucnDh1x+5=-XYB1Q9aeG4JLi9vObvfR5gpeL6BkyTMeH6tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

>> diff --git a/package/multimedia/gstreamer1/Config.in b/package/multimedia/gstreamer1/Config.in
>> new file mode 100644
>> index 0000000..b1fd8b1
>> --- /dev/null
>> +++ b/package/multimedia/gstreamer1/Config.in
>> @@ -0,0 +1,37 @@
>> +config BR2_PACKAGE_GSTREAMER1
>> +     bool "gstreamer1"
>> +     depends on BR2_USE_WCHAR # glib2
>> +     depends on BR2_TOOLCHAIN_HAS_THREADS
>> +     select BR2_PACKAGE_LIBGLIB2
>> +     help
>> +       GStreamer is an open source multimedia framework.
>> +
>> +       http://gstreamer.freedesktop.org/
>
> Is it possible to build/install gstreamer and gstreamer1 side by side?
> I.e, I'm wondering if we should make those two mutually exclusive
> choices, or if we can let the user select both if needed.

From the limited testing I have done, the answer is yes and it may not
require any patches.  Looks like everything neatly installs into a
/usr/lib/gstreamer-1.0 folder or a /usr/lib/<name>-1.0.so; the pc
files end up with <name>-1.0 postfixes;  all include files are in
/usr/lib/gstreamer-1.0; and the executables all have a -1.0 postfix.

> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
