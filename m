From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 29 Aug 2007 11:02:58 +0100
Subject: [Buildroot] Problem #including <string>
Message-ID: <46D54452.7080204@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have built buildroot with the attached config for x86, with support 
for c++.

However whenever I include <string> I get errors in my code because it 
seems somewhere in <string> it is #defining index.

If I attempt to compile the following code:

#ifdef index
#error foo
#endif

#include <string>

#ifdef index
#error bar
#endif

void do_nothing()
{
}

Then I get the second error.

I have tried searching through the headers to find where the #define 
index is but I have been unable to find it. Can anyone suggest the best 
way of locating where index is being erroneously defined?

Many thanks,

Will.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 14551 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070829/aa8a1ec6/attachment-0001.xml 
