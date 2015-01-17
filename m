From: Steve Kenton <skenton@ou.edu>
Date: Sat, 17 Jan 2015 16:34:24 -0600
Subject: [Buildroot] [PATCH V2] dvd+rw-tools: new package
In-Reply-To: <XnsA425C51B017E9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <54B9B774.9030204@ou.edu>
 <XnsA425C51B017E9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <54BAE370.7060404@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/17/2015 12:22 PM, Bernd Kuhls wrote:
> according to Beyond Linux From Scratch you need libisoburn or a similar 
> package which provides xorrisofs, otherwise "the growisofs command will not 
> function properly"
> http://www.linuxfromscratch.org/blfs/view/svn/multimedia/dvd-rw-tools.html
> 
> Did your package work without xorrisofs during your tests?
> 
> Regards, Bernd
I was working on xorriso, dvdauthor, dvd+rw-tools and mjpegtools simultaneously
for my embedded project. Once they all worked I cleaned them up for submission.
GNU Xorriso includes all the libburnia libraries as well as the xorriso burner program.
FYI - Xorriso and dvdauthor were just committed. I did not think to check for hidden runtime
dependencies when I was working up the submission for those four packages individually. I just
worked on getting each of them to build in a clean buildroot snapshot for both uClibc and glibc.

If it was not a feature that I needed for my project right then it probably did not get
run time tested. So I can well believe there may be other dependencies that I did not discover.
Thanks for the tip, I'll try it out stand-alone and see what I find.

Steve
