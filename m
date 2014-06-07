From: Will Wagner <will_wagner@carallon.com>
Date: Sat, 07 Jun 2014 22:54:38 +0100
Subject: [Buildroot] [RFCv1 0/4] Generating a graph of the size
 installed by each package
In-Reply-To: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <53938A1E.4060802@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/06/2014 22:46, Thomas Petazzoni wrote:
> Hello,
>
> I gave a training this week, and one of the question I had was how to
> analyze the size of the things that are present on the root
> filesystem. And I thought that Buildroot was lacking a tool to help
> with this. Therefore, the following set of commits implement a script
> that generates a pie chart of the size contribution of each package to
> the target root filesystem.

Would certainly be useful in buildroot, your idea looks good.

>
> To see an example of the generated pie chart, see:
>
>    http://free-electrons.com/~thomas/pub/buildroot/graph-size.pdf
>
> The implementation consists in adding a global instrumentation hook
> that registers which files are installed by each package. A limitation
> of the current implementation is that when a file is installed by a
> package A and then overriden by package B, the mechanism will assume
> the file was installed by package A. Suggestions to welcome on how to
> solve this in a reasonably simple way.

Can you not record the timestamp the first time you see the file and see 
if it has changed at the end. I appreciate a bash script to do this is 
going to be pretty hard.

Regards
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
