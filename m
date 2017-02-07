From: Luca Ceresoli <lucaceresoli77@gmail.com>
Date: Tue, 7 Feb 2017 11:48:51 +0100
Subject: [Buildroot] [PATCH] support/scripts: add script to test a
	package
In-Reply-To: <20170207093303.GB3578@free.fr>
References: <1486404173-31700-1-git-send-email-yann.morin.1998@free.fr>
 <508724e1-501e-4e44-6817-55bcdbf2f8ee@lucaceresoli.net>
 <20170207093303.GB3578@free.fr>
Message-ID: <d27fcad2-14be-ebe7-8786-d8d3f1726176@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas,

On 07/02/2017 10:33, Yann E. MORIN wrote:
> Luca, All,
> 
> On 2017-02-06 21:40 +0100, Luca Ceresoli spake thusly:
>> On 06/02/2017 19:02, Yann E. MORIN wrote:
> [--SNIP--]
>>> +    printf ", olddefconfig"
>>> +    if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
>>> +        printf ": FAILED\n"
>>> +        return
>>> +    fi
>>> +    while read line; do
>>> +        if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then
>>
>> I suggest removing the redirects and using 'grep -q' here.
> 
> grep -q is not POSIX. ;-)

:-(

In the meantime I finished building one package (exim) with all
toolchains, with and without '-p exim'. I also introduced various
errors: wrong URL, wrong build/configure commands, wrong config snippet,
network disconnection.

It all work as expected. So, with the discussed fixed, I expect to add
my Acked and Tested tags.

Thanks.
-- 
Luca
