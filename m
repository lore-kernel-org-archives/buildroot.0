From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 12:03:03 -0300
Subject: [Buildroot] [PATCH 1/2] squid: bump to version 3.5.3
In-Reply-To: <20150329145243.GF12479@tarshish>
References: <1427639612-25592-1-git-send-email-gustavo@zacarias.com.ar>
 <20150329145243.GF12479@tarshish>
Message-ID: <55181427.1020109@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/29/2015 11:52 AM, Baruch Siach wrote:

> Hi Gustavo,
> 
> On Sun, Mar 29, 2015 at 11:33:31AM -0300, Gustavo Zacarias wrote:
>> +# Atomics support requires __sync_add_and_fetch_8 (64-bits)
>> +# That's only handled in gcc's libatomic for 32-bit arches
> 
> Maybe you mean "64-bit arches"? Otherwise the code does not match.

Hi Baruch.
Actually no, that's exactly what i mean.
Native atomics don't need libatomic, atomics that aren't supported by
said arch are, for example 8-byte atomics on 32-bit (4-byte) architectures.
That's cared for in gcc's libatomic, but we don't build it, hence this.
Regards.
