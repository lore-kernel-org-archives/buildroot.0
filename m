From: Marc Lindahl <marc@bowery.com>
Date: Wed, 1 Nov 2006 12:17:14 -0500
Subject: [Buildroot] Persistent tarball repository
In-Reply-To: <1f11a5490611010841n3a71baeei8d55aa4dc7251330@mail.gmail.com>
References: <loom.20061101T151612-639@post.gmane.org>
	<1162394701.2945.4.camel@iridium.gnat.ca>
	<loom.20061101T164136-413@post.gmane.org>
	<1f11a5490611010801o629294ffw7cde4e3f98778d16@mail.gmail.com>
	<loom.20061101T171522-277@post.gmane.org>
	<1f11a5490611010841n3a71baeei8d55aa4dc7251330@mail.gmail.com>
Message-ID: <1a2b58b88744ef4e337f310b1b5b0c3a@bowery.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_DL_DIR already there no patch needed... why do you need to move it 
around so much it needs to be in menuconfig?

also I disagree with patching distclean, then it will not behave the 
way all other distcleans everywhere behave.   Make a new option instead 
(though for the life of me I can't figure out what you'd need it for)

my $0.02,
Marc

On Nov 1, 2006, at 11:41 AM, Ashwin Bihari wrote:

> On 11/1/06, MikeW <mw_phil@yahoo.co.uk> wrote:
>>
>> tree, hence the semantics of distclean as you describe them mean that 
>> they
>> must go.
>>
>> If they were outside the buildroot tree, then I guess distclean ought 
>> not
>> to clear them out.
>>
>> Wonder if that's the making of a patch - only 'distclean' delete
>> downloaded tarballs if they occur under the buildroot directory;
>> but currently there's no menuconfig option to say where downloads are 
>> kept ...
>> however at the moment I just want something that 'works out of the 
>> box'!
>>
>> Thanks,
>> MikeW
>
> Mike,
>
> By all means provide a patch that allows you to change the location of 
> the DL directory and whether or not it should be deleted during a 
> distclean. I would definitely find it useful and if others agree, it 
> might get committed.
>
> Regards
>
> -- 
> ~ Ashwin_______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: text/enriched
Size: 1438 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061101/38ba48dd/attachment.bin 
