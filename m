From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 19 Jul 2013 15:32:07 +0200
Subject: [Buildroot] [PATCH] dhcp: add config option for delayed-ack
 feature of dhcp server
In-Reply-To: <51E93C09.2090906@zacarias.com.ar>
References: <2ac4c1f0c7025c5012b9.1374237997@BEANTN0L019720>
 <51E93C09.2090906@zacarias.com.ar>
Message-ID: <CAAXf6LWbC+GDgjnw3tfE-yuw6u6V0btBOKY1wtenbp_zMGP-Qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Fri, Jul 19, 2013 at 3:15 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 07/19/2013 09:46 AM, Thomas De Schampheleire wrote:
>> +config BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK
>> +     bool "Enable delayed ACK feature"
>> +     depends on BR2_PACKAGE_DHCP_SERVER
>> +     help
>> +       Enable delayed ACK feature in the ISC DHCP server.
>
> Can't you just enable it to avoid config cluttering?
> AFAIK it's not a default-on option in dhcpd.conf

Maybe, I'm not an expert on the matter. The RELNOTES file says the
following for 4.1.0a2:
 "Delayed-ack is now a compile-time option, compiled out by default.
  This feature is simply too experimental for right now, and causes
  some problems to some failover installations.  We will revisit this
  in future releases."

and also the man page:
"Please note that as delayed-ack is currently experimental, the delayed-ack
feature is not compiled in by default, but must be enabled at compile time
with \'./configure --enable-delayed-ack\'."

but in the meantime we're several releases further. I don't know if it
is still accurate.

I think you're right that it's not default-on in dhcpd.conf.

What do you say, enable it always at compile time?

Thanks,
Thomas
