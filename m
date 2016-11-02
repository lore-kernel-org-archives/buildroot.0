From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed, 2 Nov 2016 19:07:11 -0400
Subject: [Buildroot] [PATCH 2/2] package/babeltrace: enable debug info
 support for the host variant
In-Reply-To: <20161102232930.61516f88@free-electrons.com>
References: <20161031074624.7576-10-eeppeliteloop@gmail.com>
 <1477918137-25258-2-git-send-email-yann.morin.1998@free.fr>
 <20161102232930.61516f88@free-electrons.com>
Message-ID: <CAB4xu_2PJ2gf1+fNhbHvrHKTUeg3H_Lb0ADMrdywxK0tKphgrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 2, 2016 at 6:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 31 Oct 2016 13:48:57 +0100, Yann E. MORIN wrote:
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Philippe Proulx <eeppeliteloop@gmail.com>
>> ---
>>  package/babeltrace/babeltrace.mk | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/babeltrace/babeltrace.mk b/package/babeltrace/babeltrace.mk
>> index d178a6c..17eaaaa 100644
>> --- a/package/babeltrace/babeltrace.mk
>> +++ b/package/babeltrace/babeltrace.mk
>> @@ -12,8 +12,8 @@ BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
>>  BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
>>  BABELTRACE_CONF_OPTS += --disable-debug-info
>>  HOST_BABELTRACE_DEPENDENCIES = \
>> -     host-popt host-util-linux host-libglib2 host-pkgconf
>> -HOST_BABELTRACE_CONF_OPTS += --disable-debug-info
>> +     host-popt host-util-linux host-libglib2 host-pkgconf host-elfutils
>
> Since the dependency on elfutils is not mandatory, do we really want to
> force building the support of debug info?

Ideally, no. I guess we should use the same strategy as for the target package.

Phil

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
