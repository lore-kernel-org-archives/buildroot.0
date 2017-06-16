From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 16 Jun 2017 17:24:40 +0200
Subject: [Buildroot] libasan.so missing
In-Reply-To: <6a986028-02cd-4d47-92a6-14cd74c793dc@cesnet.cz>
References: <05992a34-6e01-9d75-926f-ab5a2e0e10a1@grandegger.com>
 <6a986028-02cd-4d47-92a6-14cd74c793dc@cesnet.cz>
Message-ID: <6aac3b8f-94b6-ea53-25f8-499fbe931e4b@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan,

Am 16.06.2017 um 14:14 schrieb Jan Kundr?t:
> On st?eda 14. ?ervna 2017 9:14:46 CEST, Wolfgang Grandegger wrote:
>> I'm using the x86_64 buildroot toolchain with gcc 5.4. I wonder why 
>> the address sanitizer library "libasan.so*" is not available in the 
>> rootfs of the target. Is it intentional? And what is the best way to 
>> get it added to the rootfs?
> 
> I was hitting the same problem but with GCC 6.3. I "kinda solved it" by 
> simply copying the files around; I'm afraid I don't want to dive into 
> GCC's makefiles to see why these are getting skipped. 

Yes, copying the library to the target directory in a board-specific 
script is an option (the wrong rpath should not harm). I just wonder why 
it's not available, at least in the staging tree. Maybe somebody can 
explain why?

Wolfgang.
