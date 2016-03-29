From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Mar 2016 21:25:40 +0200
Subject: [Buildroot] [PATCH V2] Add Xen 4.6
In-Reply-To: <CAKmqyKOCUKKQJRg6jK5TdJ33XbyATjsWrj41Gdy2zU7FwHz7mg@mail.gmail.com>
References: <1457483717-17947-1-git-send-email-alistair.francis@xilinx.com>
 <56F7D7FA.40001@mind.be>
 <CAKmqyKOCUKKQJRg6jK5TdJ33XbyATjsWrj41Gdy2zU7FwHz7mg@mail.gmail.com>
Message-ID: <56FAD6B4.5000706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/28/16 20:59, Alistair Francis wrote:
> On Sun, Mar 27, 2016 at 5:54 AM, Arnout Vandecappelle<arnout@mind.be>  wrote:
[snip]
>> >  For some reason, it doesn't seem to be cross-compiling for me, it uses
>> >"gcc" to build. I think you need to pass TARGET_CONFIGURE_OPTS in
>> >XEN_MAKE_ENV.
> I see the same problem. I tried using TARGET_CONFIGURE_OPTS in
> XEN_MAKE_ENV but it still uses GCC.
>
> The configure scripts detects an AArch64 target correctly, but it
> still uses GCC. Any other ideas?

  Try passing CROSS_COMPILE in XEN_MAKE_ENV.

  You may also need to set XEN_TARGET_ARCH, AFAICS it is not derived automatically.

  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
