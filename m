From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Tue, 13 Mar 2012 14:16:13 +0000
Subject: [Buildroot] [PATCH] imagemagick: Ignore host's xml2-config
In-Reply-To: <4F5F544B.4000601@imgtec.com>
References: <1331645708-7650-1-git-send-email-markos.chandras@imgtec.com>
 <877gyoli9n.fsf@macbook.be.48ers.dk> <4F5F544B.4000601@imgtec.com>
Message-ID: <4F5F56AD.2020408@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/13/2012 02:06 PM, Markos Chandras wrote:

> On 03/13/2012 01:53 PM, Peter Korsgaard wrote:
> 
>>>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:
>>
>>  Markos> If $(HOST_DIR)/usr/bin is in the user's $PATH, and host-libxml2 is
>>  Markos> installed, the configure script will find xml2-config in
>>  Markos> $(HOST_DIR)/usr/bin  and the xml2-config --prefix will return the
>>  Markos> $(HOST_DIR)/usr. This is bad because imagemagick will append
>>  Markos> -L$(HOST_DIR)/usr/lib to LDFLAGS and it will try to link against
>>  Markos> the host's libraries instead of those located in the staging directory.
>>
>> Hmm, is this still a problem? We already have a libxml2 patch for
>> imagemagick to ensure it picks up the target one, and we explicitly pass
>> --without-xml if we're not building libxml2 for the target.
>>
>> Are you testing against buildroot git? From the the patch file name I
>> would guess not. Could you retry with latest git and let me know if it
>> is still needed?
>>
> 
> Are you referring to the imagemagick-6.6.4-8-use-xml2-config.patch? If
> yes, this does not fix the problem because AC_CHECK_PROG() searches for
> programmes in the $PATH and if $(HOST_DIR)/usr/bin/xml2-config is in the
> path, it will find that and set xml2_config variable to $(HOST_DIR)/usr
> which in turn sets LDFLAGS to -L{xml2_config}/lib
> 

Hmm I think you are right. The imagemagick-6.6.4-8-use-xml2-config.patch
did not apply to my tree. Let me do some further testing and I will
reply back

-- 
markos
