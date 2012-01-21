From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jan 2012 03:53:59 +0100
Subject: [Buildroot] Qt command line issue
In-Reply-To: <2cff0fc240e25617ac5c8ae586f9c698@bluespirit.la>
References: <2cff0fc240e25617ac5c8ae586f9c698@bluespirit.la>
Message-ID: <201201210353.59935.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 20 January 2012 12:32:17 Karl Krach wrote:
> 2) The output via SSH lacks of a "carriage return". On X11 it's working 
> fine, but on the ARM evaluation board the output looks like this:
> my debug output
>                 my debug output
>                                my debug output
>                                               my debug output
>                                                              ...
 
 Are you sure you get this over SSH?  This is typically what you see on a
serial terminal.  The serial terminal should be configured to expect LF
instead of CRLF.  Alternatively, if you have a shell on the other side,
you can do 'stty onlret' (or is it -onlret?) to let the tty driver insert
the CR.

 Don't know about your other issue.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
