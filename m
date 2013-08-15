From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 15 Aug 2013 11:56:54 +0100
Subject: [Buildroot] [PATCH] libsecret: New package
In-Reply-To: <520CB048.6060707@zacarias.com.ar>
References: <1376562685-17191-1-git-send-email-markos.chandras@imgtec.com>
 <520CB048.6060707@zacarias.com.ar>
Message-ID: <CAG2jQ8hEpcA0CbsSjG9R1pLDdGJGy_gytGqXAvGWJuLqn6+SMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 August 2013 11:41, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> On 08/15/2013 07:31 AM, Markos Chandras wrote:
>
>> +config BR2_PACKAGE_LIBSECRET
>> +     bool "libsecret"
>> +     select BR2_PACKAGE_LIBGLIB2
>> +     help
>> +       libsecret is a library for storing and retrieving passwords and other
>> +       secrets. It communicates with the "Secret Service" using DBus.
>> +       gnome-keyring and ksecretservice are both implementations of a Secret
>> +       Service.
>> +
>> +       https://wiki.gnome.org/Libsecret
>
> You forgot to inherit LIBGLIB2 depends (WCHAR, THREADS) and add a
> comment on why it's unavailable when both aren't available.
> Other than that it looks good in principle (untested).
> Regards.

Hi Gustavo,

Thanks for the review.

Would it be better to replace 'select' with 'depend' to avoid
implicitly enabling these toolchain components?

-- 
Regards,
Markos Chandras
