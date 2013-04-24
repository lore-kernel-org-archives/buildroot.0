From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Apr 2013 03:07:13 -0300
Subject: [Buildroot] [PATCH] busybox: rename patches as per the new
 standard and update 1.21.0 mdev
In-Reply-To: <87bo94divm.fsf@dell.be.48ers.dk>
References: <1366723305-14386-1-git-send-email-gustavo@zacarias.com.ar>
 <8761zde433.fsf@dell.be.48ers.dk> <5176F8B6.8020204@mind.be>
 <87bo94divm.fsf@dell.be.48ers.dk>
Message-ID: <51777691.2020702@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/2013 06:42 PM, Peter Korsgaard wrote:

>  Arnout>  Actually, if upstream has the patches available for download,
>  Arnout> they should be downloaded instead of of included in buildroot,
>  Arnout> no?
> 
> True. For busybox our patch download infrastructure unfortunately
> doesn't work as the patches aren't located in the same directory as the
> tarball (and the fact that we support multiple versions also makes it a
> bit more complicated).

The problem with downloading busybox patches directly is that upstream
kind of sucks regarding naming and updates.
For instance the mdev patch changed without being reflected in the
filename, and so did other patches in the past.
This could cause unexpected behaviour depending on which patch each user
got, specially when they're being early adopters of new versions and
using a common download directory.
Telling people to "remove your patches to force a new download and try
again" would just be adding unnecessary noise/bugs.
Regards.
