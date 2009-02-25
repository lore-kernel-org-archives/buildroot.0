From: Arnar Mar Sig <antab@valka.is>
Date: Wed, 25 Feb 2009 17:55:29 +0100
Subject: [Buildroot] Uclibc shared memory support
In-Reply-To: <BAY107-W212DB314FCF1E04A4F90CD9DAC0@phx.gbl>
References: <BAY107-W212DB314FCF1E04A4F90CD9DAC0@phx.gbl>
Message-ID: <C70C999F-CB57-4E0D-B8D4-906674523A22@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is more of a question for the uclibc mailing list, but anyway.

sysv shared memory and semaphores work out of the box. POSIX shared  
memory and semaphores on the other hand is not supported in uclibc  
last time i checked.
There is a patch floating around the uclibc mailing list that adds  
posix shared memory. If you dont want to go thru the steps of patching  
uclibc then you can just copy the shm_open and shm_unlock from the  
patch (or glibc) and build them with your app (thous 2 are really  
simple).
Not sure about status of posix semaphores but wrapping sysv sem in  
posix api is easy if you need the posix api.

On Feb 25, 2009, at 5:44 PM, Muktabh Anchlia wrote:
> Hi,
> I am not sure of this is the correct place to ask this question, but  
> I would like to know if anyone has used shared memory/semaphores/ 
> mmap with uclibc built using buildroot. I searched the uclibc  
> mailing list, but references to shared memory support are too  
> old(year 200-2001) to be verifiable.
>
> Thanks
>
> Muktabh
>
>
> " I don't take sides, just the racing line "
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Greets
	Arnar Mar Sig
	Valka ehf

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090225/19394e61/attachment.htm>
