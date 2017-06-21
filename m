From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 20 Jun 2017 23:06:58 -0300
Subject: [Buildroot] [PATCH 1/4 v2] tools: add a directory to store some
 useful user-facing tools
References: <20170619154227.GA3045@scaer>
Message-ID: <5949d4c290853_3c4af6e910447ac@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Jun 19, 2017 at 12:42 PM, Yann E. MORIN wrote:

> On 2017-06-18 22:11 -0300, Ricardo Martincoski spake thusly:
[snip]
>> BUT if it is called without a .config file, it hangs forever waiting for input,
>> and the menuconfig is sent to the log file.
> 
> Indeed, my use-case is to only use it in an already-configured tree.
> 
>> Maybe we can bailout if no .config is present.
> 
> Hmmm... It's not trivial do detect, because the .config file is not
> necessarily in the current directory, for example:
> 
>     brmake -C /pat/to/buil-dir
> 
> and I don't want to write a make option interpeter either...

Oh, I see now it is not trivial.

> 
> But I'll see what I can do.

Only on the first use the user can get confused.
I think adding a usage example in the file header is enough, saying the script
must be run inside or pointing to (-C from make) an output directory already
configured, or something like that.

[snip]
>> > +    a script that can be run instead of make, that prepends the date in
>> > +    front of each line, redirects all of the build output to a file
>> > +    ("'br.log' in the current directory), and just ouputs the Buildroot
>> 
>> Maybe this file will be dropped as discussed in
>> http://patchwork.ozlabs.org/patch/777446/
>> If not, there is a typo
>> 
>> ouputs -> outputs
> 
> Yup, I already dropped the file locally.
[snip]

The purpose of the script (initially in 00-README.txt, with the typo fixed)
could be placed in the script header as well.

Regards,
Ricardo
