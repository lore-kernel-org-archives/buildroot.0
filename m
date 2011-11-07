From: Ryan Raasch <ryan.raasch@gmail.com>
Date: Mon, 7 Nov 2011 16:26:43 +0100
Subject: [Buildroot] [PATCH] sysklogd: Check for hanging link file also
 when installing the conf file.
In-Reply-To: <CAHRBi55JHGmnNkhOYvMzipehTjuavKgFMvrNvkZs5BrwyFnWfw@mail.gmail.com>
References: <1320676850-20690-1-git-send-email-ryan.raasch@gmail.com>
 <20111107162157.783b9a2f@skate>
 <CAHRBi55JHGmnNkhOYvMzipehTjuavKgFMvrNvkZs5BrwyFnWfw@mail.gmail.com>
Message-ID: <CAHRBi56_zp8Y6LO1dVOS4N4YAmBb+GWRiu=C2MjLsckvr1dchw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

# ln hello
# if [ ! -e hello ] ; then echo "I don't exist"; fi
I don't exist

I thought -e worked also.

/Ryan

On 7 November 2011 16:24, Ryan Raasch <ryan.raasch@gmail.com> wrote:
> I tried that also. It returns false also on a dangling link.
>
> /Ryan
>
> On 7 November 2011 16:21, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Le Mon, 7 Nov 2011 15:40:50 +0100,
>> Ryan Raasch <ryan.raasch@gmail.com> a ?crit :
>>
>>> - ? ? if [ ! -f $(TARGET_DIR)/etc/syslog.conf ]; then \
>>> + ? ? if [ ! -f $(TARGET_DIR)/etc/syslog.conf ] && [ ! -h $(TARGET_DIR)/etc/syslog.conf ] ; then \
>>
>> Wouldn't
>>
>>> - ? ? if [ ! -e $(TARGET_DIR)/etc/syslog.conf ]; then \
>>
>> Be better ?
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
