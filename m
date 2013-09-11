From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Sep 2013 21:51:23 -0300
Subject: [Buildroot] [PATCH 07/11] ulogd: needs mmu and shared objects
In-Reply-To: <CAFRkauD7kWP2dNfTpWGjwZFDFtQZ7LXLCLHYHdG7xBy5EohhJw@mail.gmail.com>
References: <1378841180-23467-1-git-send-email-gustavo@zacarias.com.ar>
 <1378841180-23467-7-git-send-email-gustavo@zacarias.com.ar>
 <CAFRkauD7kWP2dNfTpWGjwZFDFtQZ7LXLCLHYHdG7xBy5EohhJw@mail.gmail.com>
Message-ID: <522FBE8B.4080001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/10/2013 09:48 PM, Axel Lin wrote:

>> +comment "ulogd requires a toolchain with IPV6, LARGEFILE and dynamic library support"
>> +       depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
>> +       depends on BR2_USE_MMU
> I guess what you want is "depends on !BR2_USE_MMU" here?

No, ulogd needs a MMU, so the comment is still valid, you can't do
anything about lacking a MMU like you could with toolchain options (it
would show ulogd as being available for your nommu target if the
toolchain lacks the necessary features?)
Not the first time someone complains about negative logic :)
Regards.
