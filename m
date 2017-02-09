From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 9 Feb 2017 10:43:40 +0100
Subject: [Buildroot] rsyslog plugin selection
In-Reply-To: <8737fopew4.fsf@dell.be.48ers.dk>
References: <CAAXf6LUgTQBZK7HnzKd6q64XnAA7nX_n7X3LDdRZfEvKtfeq7w@mail.gmail.com>
 <8737fopew4.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LU7juM840CBNO7=wus8H_OUuByzNW7jwKZ36GX4dp9c9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 8, 2017 at 10:10 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > Hi,
>  > The rsyslog package in Buildroot currently hardcodes the list of
>  > plugins to enable. These plugins define what types of input, output,
>  > parsing, etc. is supported, and is typically very application
>  > dependent.
>
>  > The current selection amounts to about 1 MB of rootfs, while the
>  > rsyslog daemon itself is only about half of that. By restricting the
>  > list of plugins to those a project actually needs, it is thus possible
>  > to reduce the size of the rootfs.
>
>  > Two questions arise:
>  > 1. should we use one config symbol with a string list, or separate
>  > config symbols for each plugin?
>
>  > 2. should we keep the current set as default, even if it contains less
>  > common options?
>
> Separate config options are IMHO quite a lot more user friendly, so if
> we are not talking about a LOT (20+) of options then that is what I
> would prefer.
>

I should have mentioned it in my original mail, but the amount of
plugins is about 50:
http://www.rsyslog.com/plugins/

Nevertheless, I do think that using separate options is indeed the
best approach. To limit the visual impact in the config editor, I
would group them in a submenu instead of flat in the main menu.

Do you agree?


Thanks,
Thomas
