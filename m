From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Mar 2015 21:32:00 +0100
Subject: [Buildroot] Changing permission recursively
In-Reply-To: <20150312175527.GO2177@tarshish>
References: <CA+TH9VmbEdw=Zx3C1_fHcnK=FDum+6C6UbsVVad12yR3gmK7AA@mail.gmail.com>
 <20150312175527.GO2177@tarshish>
Message-ID: <5501F7C0.5050309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/03/15 18:55, Baruch Siach wrote:
> Hi Angelo,
> 
> On Thu, Mar 12, 2015 at 10:08:10AM +0100, Angelo Compagnucci wrote:
>> I'm in the process of building a rootfs for a custom application and
>> wondering the best way to change permissions recursively for a
>> directory.
>>
>> What I'm trying to achieve is to add some files via an overlay, but
>> files should have a specific owner/permission which should be read
>> from the buildroot's users table.
>>
>> I cannot find something like that in the documentation. Instead, the
>> documentation specifies how to add single files and change
>> owner/permission accordingly.
>>
>> If I understand correctly, I should create a new user (if necessary)
>> with a specific UDI/GID and than use a POST_INSTALL_TARGET to change
>> permission using that UID/GID.
>> Alternatively, I can use FOO_PERMISSIONS with a per file granularity.
>>
>> Is this correct?
> 
> How about running the following from a post build script (untested):
> 
> 	${HOST_DIR}/usr/bin/fakeroot -- chown -R UID:GID ${1}/path/to/directory
> 
> baruch
> 

 I think it would be easier to extend package/makedevs/makedevs.c to support
recursive operation.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
